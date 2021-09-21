#!/bin/bash

jupyter contrib nbextension install --sys-prefix

jupyter nbextension install rise --py --sys-prefix
jupyter nbextension install ipyturtle --py --sys-prefix
jupyter nbextension install widgetsnbextension --py --sys-prefix
jupyter nbextension install latex_envs --py --sys-prefix

jupyter nbextension enable rise --sys-prefix --py
jupyter nbextension enable ipyturtle --sys-prefix --py
jupyter nbextension enable latex_envs --sys-prefix --py
jupyter nbextension enable toggle_all_line_numbers/main --sys-prefix
jupyter nbextension enable widgetsnbextension --sys-prefix --py

jupyter nbextension enable varInspector/main --sys-prefix
jupyter nbextension enable zenmode/main --sys-prefix
jupyter nbextension enable code_prettify/code_prettify --sys-prefix
jupyter nbextension enable highlight_selected_word/main --sys-prefix
jupyter nbextension enable livemdpreview/livemdpreview --sys-prefix
jupyter nbextension enable scratchpad/main --sys-prefix
jupyter nbextension enable codefolding/main --sys-prefix
jupyter nbextension enable hinterland/hinterland --sys-prefix
jupyter nbextension enable limit_output/main --sys-prefix
jupyter nbextension enable contrib_nbextensions_help_item/main --sys-prefix
jupyter nbextension enable rubberband/main --sys-prefix
jupyter nbextension enable exercise/main --sys-prefix
