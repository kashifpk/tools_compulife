"""
Main code highlighting code
"""

from pygments import highlight
from pygments.lexers import get_all_lexers, get_lexer_by_name
from pygments.formatters import get_formatter_by_name
from pygments.styles import STYLE_MAP


def get_names():
    "Returns names of all available lexers and styles"

    lexer_names = [ i[0].lower() for i in get_all_lexers() ]

    return sorted(lexer_names), sorted(STYLE_MAP.keys())


def highlight_code(code, language, style, output_format='html'):
    """
    Highlights given code string

    * code - The code to highlight
    * language - Language to use for code highlighting (for example, python, html etc)
    * style - highlighting color scheme

    """

    lexer = get_lexer_by_name(language, stripall=True)
    formatter = get_formatter_by_name(output_format, style=style,
                                      linenos=True, cssclass="source")
    highlighted_code = highlight(code, lexer, formatter)

    css_code = formatter.get_style_defs('.highlight')

    return css_code, highlighted_code
