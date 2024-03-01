#!/usr/bin/env python3

import re
import subprocess

from pathlib import Path, PurePath

SEMVER_PATTERN = r"(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?"

APPIMAGE_FOLDER = Path.home() / "apps"
MENU_ITEM_FOLDER = Path.home() / ".local/share/applications"

def main():
    # List appimages in appimage_folder
    appimages: list[str] = []

    for app in APPIMAGE_FOLDER.iterdir():
        if app.suffix == ".AppImage":
            filename = str(app)
            match = re.search(SEMVER_PATTERN, filename)
            if match:
                appimages.append(filename)

    # Mapping from exec value to menu item path
    menu_item_exec_value_to_path: dict[str, Path] = {}

    for menu_item in MENU_ITEM_FOLDER.iterdir():
        if menu_item.suffix == ".desktop":
            with menu_item.open() as fin:
                for line in fin:
                    if line.startswith("Exec"):
                        exec_value = line.split("=")[1].strip()
                        exec_value_with_version_replaced = re.sub(SEMVER_PATTERN, "*", exec_value)
                        menu_item_exec_value_to_path[exec_value_with_version_replaced] = menu_item


    for k, v in menu_item_exec_value_to_path.items():
        print(k, v)
    print()
    # Update menu item
    for filename in appimages:
        basename = PurePath(filename).stem
        extension = PurePath(filename).suffix
        basename_with_version_replaced = re.sub(SEMVER_PATTERN, "*", basename)
        filename_with_version_replaced = f"{APPIMAGE_FOLDER}/{basename_with_version_replaced}{extension}"
        menu_item_path = menu_item_exec_value_to_path[filename_with_version_replaced]
        lines: list[str] = []
        with menu_item_path.open() as fin:
            for line in fin:
                if line.startswith("Exec"):
                    line = f"Exec={filename}\n"
                lines.append(line)

        with menu_item_path.open("w") as fout:
            fout.writelines(lines)
        menu_item_path.chmod(0o755)


if __name__ == "__main__":
    script_name = PurePath(__file__).name
    message = "Successfully executed"
    try:
        main()
    except Exception as e:
        message = f"{type(e).__name__}: {e}"
        raise e
    finally:
        subprocess.run(["notify-send", script_name, message])
