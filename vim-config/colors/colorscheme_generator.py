# pyright: strict

from typing import List, Dict, Mapping
from string import Template

# xterm 256 colors, color 0~15 are gnome-terminal default palette
COLORS = [
    "2e3436", "cc0000", "4e9a06", "c4a000", "3465a4", "75507b", "06989a", "d3d7cf",
    "555753", "ef2929", "8ae234", "fce94f", "729fcf", "ad7fa8", "34e2e2", "eeeeec",
    "000000", "00005f", "000087", "0000af", "0000d7", "0000ff", "005f00", "005f5f",
    "005f87", "005faf", "005fd7", "005fff", "008700", "00875f", "008787", "0087af",
    "0087d7", "0087ff", "00af00", "00af5f", "00af87", "00afaf", "00afd7", "00afff",
    "00d700", "00d75f", "00d787", "00d7af", "00d7d7", "00d7ff", "00ff00", "00ff5f",
    "00ff87", "00ffaf", "00ffd7", "00ffff", "5f0000", "5f005f", "5f0087", "5f00af",
    "5f00d7", "5f00ff", "5f5f00", "5f5f5f", "5f5f87", "5f5faf", "5f5fd7", "5f5fff",
    "5f8700", "5f875f", "5f8787", "5f87af", "5f87d7", "5f87ff", "5faf00", "5faf5f",
    "5faf87", "5fafaf", "5fafd7", "5fafff", "5fd700", "5fd75f", "5fd787", "5fd7af",
    "5fd7d7", "5fd7ff", "5fff00", "5fff5f", "5fff87", "5fffaf", "5fffd7", "5fffff",
    "870000", "87005f", "870087", "8700af", "8700d7", "8700ff", "875f00", "875f5f",
    "875f87", "875faf", "875fd7", "875fff", "878700", "87875f", "878787", "8787af",
    "8787d7", "8787ff", "87af00", "87af5f", "87af87", "87afaf", "87afd7", "87afff",
    "87d700", "87d75f", "87d787", "87d7af", "87d7d7", "87d7ff", "87ff00", "87ff5f",
    "87ff87", "87ffaf", "87ffd7", "87ffff", "af0000", "af005f", "af0087", "af00af",
    "af00d7", "af00ff", "af5f00", "af5f5f", "af5f87", "af5faf", "af5fd7", "af5fff",
    "af8700", "af875f", "af8787", "af87af", "af87d7", "af87ff", "afaf00", "afaf5f",
    "afaf87", "afafaf", "afafd7", "afafff", "afd700", "afd75f", "afd787", "afd7af",
    "afd7d7", "afd7ff", "afff00", "afff5f", "afff87", "afffaf", "afffd7", "afffff",
    "d70000", "d7005f", "d70087", "d700af", "d700d7", "d700ff", "d75f00", "d75f5f",
    "d75f87", "d75faf", "d75fd7", "d75fff", "d78700", "d7875f", "d78787", "d787af",
    "d787d7", "d787ff", "d7af00", "d7af5f", "d7af87", "d7afaf", "d7afd7", "d7afff",
    "d7d700", "d7d75f", "d7d787", "d7d7af", "d7d7d7", "d7d7ff", "d7ff00", "d7ff5f",
    "d7ff87", "d7ffaf", "d7ffd7", "d7ffff", "ff0000", "ff005f", "ff0087", "ff00af",
    "ff00d7", "ff00ff", "ff5f00", "ff5f5f", "ff5f87", "ff5faf", "ff5fd7", "ff5fff",
    "ff8700", "ff875f", "ff8787", "ff87af", "ff87d7", "ff87ff", "ffaf00", "ffaf5f",
    "ffaf87", "ffafaf", "ffafd7", "ffafff", "ffd700", "ffd75f", "ffd787", "ffd7af",
    "ffd7d7", "ffd7ff", "ffff00", "ffff5f", "ffff87", "ffffaf", "ffffd7", "ffffff",
    "080808", "121212", "1c1c1c", "262626", "303030", "3a3a3a", "444444", "4e4e4e",
    "585858", "606060", "666666", "767676", "808080", "8a8a8a", "949494", "9e9e9e",
    "a8a8a8", "b2b2b2", "bcbcbc", "c6c6c6", "d0d0d0", "dadada", "e4e4e4", "eeeeee",
]


def _cterm_to_gui(s: str):
    '''
    Auto-generate gui, guifg, guibg from cterm, ctermfg, ctermbg
    '''
    lines = s.splitlines()
    output_lines: List[str] = list()

    for line in lines:
        if not line.startswith("hi"):
            output_lines.append(line)
            continue
        tokens = line.split()
        highlight_group = tokens[1]
        if highlight_group in ("clear", "link"):
            output_lines.append(line)
            continue

        settings: Dict[str, str] = dict()
        for token in tokens[2:]:
            k, v = token.split("=")
            settings[k] = v

        cterm = settings.get("cterm")
        ctermfg = settings.get("ctermfg")
        ctermbg = settings.get("ctermbg")
        newline = f"{tokens[0]} {highlight_group}"
        gui_setting = ""
        if cterm:
            newline += f" cterm={cterm}"
            gui = cterm
            gui_setting += f" gui={gui}"
        if ctermfg:
            newline += f" ctermfg={ctermfg}"
            guifg = ctermfg
            if guifg.isdecimal():
                guifg = "#" + COLORS[int(guifg)]
            gui_setting += f" guifg={guifg}"
        if ctermbg:
            newline += f" ctermbg={ctermbg}"
            guibg = ctermbg
            if guibg.isdecimal():
                guibg = "#" + COLORS[int(guibg)]
            gui_setting += f" guibg={guibg}"
        newline += gui_setting
        output_lines.append(newline)

    return "\n".join(output_lines) + "\n"


def _colors_to_mapping(colors: Mapping[str, int]):
    '''
    Convert colors value to string and add "text_{color}" mappings, where
    "text_{color}" mapping is a valid cterm setting with ctermfg={color_num}

    Example input/output:

    Input:
        colors = {
            "white": 231,
            "pink": 197,
        }

    Output:
        mapping = {
            "white": "231",
            "pink": "197",
            "text_white": "cterm=NONE ctermfg=231 ctermbg=NONE",
            "text_pink": "cterm=NONE ctermfg=197 ctermbg=NONE",
        }
    '''
    mapping: Dict[str, str] = dict()
    for color, color_num in colors.items():
        mapping[color] = str(color_num)
        mapping[f"text_{color}"] = f"cterm=NONE ctermfg={color_num} ctermbg=NONE"
    return mapping


def generate_colorscheme(colorscheme_name: str, template: str, colors: Mapping[str, int]):
    mapping = _colors_to_mapping(colors)
    mapping["colorscheme_name"] = colorscheme_name
    s = Template(template)
    s = s.substitute(mapping)
    output = _cterm_to_gui(s)
    with open(f"{colorscheme_name}.vim", "w") as fout:
        fout.write(output)
