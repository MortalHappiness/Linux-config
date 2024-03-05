#!/usr/bin/env python3

import logging
import os
import re
import subprocess

from pathlib import Path, PurePath

PATTERN = r"-(?!.*\/)[^\/]*\.AppImage"

APPIMAGE_FOLDER = Path.home() / "apps"
MENU_ITEM_FOLDER = Path.home() / ".local/share/applications"

def main():
    # List appimages in appimage_folder
    appimages: list[str] = []

    for app in APPIMAGE_FOLDER.iterdir():
        if app.suffix == ".AppImage":
            filename = str(app)
            match = re.search(PATTERN, filename)
            if match:
                appimages.append(filename)

    for filename in appimages:
        logging.debug(f"filename: {filename}")

    # Mapping from exec value to menu item path
    menu_item_exec_value_to_path: dict[str, Path] = {}

    for menu_item in MENU_ITEM_FOLDER.iterdir():
        if menu_item.suffix == ".desktop":
            with menu_item.open() as fin:
                for line in fin:
                    if line.startswith("Exec") and line.endswith(".AppImage\n"):
                        exec_value = line.split("=")[1].strip()
                        exec_value_with_version_replaced = re.sub(PATTERN, "-*.AppImage", exec_value)
                        menu_item_exec_value_to_path[exec_value_with_version_replaced] = menu_item

    for exec_value, menu_item_path in menu_item_exec_value_to_path.items():
        logging.debug(f"exec_value: {exec_value}, menu_item_path: {menu_item_path}")

    # Update menu item
    for filename in appimages:
        filename_with_version_replaced = re.sub(PATTERN, "-*.AppImage", filename)
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
    LOGLEVEL = os.environ.get('LOGLEVEL', 'INFO').upper()
    logging.basicConfig(level=LOGLEVEL)

    script_name = PurePath(__file__).name
    message = "Successfully executed"
    try:
        main()
    except Exception as e:
        message = f"{type(e).__name__}: {e}"
        raise e
    finally:
        subprocess.run(["notify-send", script_name, message])
