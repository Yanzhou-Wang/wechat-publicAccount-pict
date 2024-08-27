
# I. Summarized tools
## II. Installed codes/libraries
### III. Cisco anyconnect-Cisico VPN (aalto)

- enable vpn: `/opt/cisco/anyconnect/bin/vpnui`
### III. matlab (aalto)
- enable matlab: `/home/wyz/code_inst/matlab_R2023b_glnxa64-install-loc/bin/matlab`

### III. Miniconda

- Miniconda shell envs
  - "/home/wyz/code_inst/anaconda3/condabin": just for execuative `conda` binary, stay atumatically in shell env (by automatic modification of ~/.bashrc)
  - "~/.conda"
  - "/home/wyz/code_inst/anaconda3/bin": only activated in shell env when type `conda activate`
  > One can check out by typing `python -c 'import sys; print(sys.path)'` in shell cmd line.

- Miniconda python3.10 envs

  | name | env|
  | --- | --- |
  | base | /home/wyz/code_inst/miniconda3|
  | cda-picky-pynep-wizard | /home/wyz/code_inst/miniconda3/envs/cda-picky-pynep-wizard|

### III. Self-contained python

- Self-contained python3.11 shell env
  - "/usr/bin"
- Python env

  | name | env |
  | --- | --- |
  | pyvenv-common | ~/venvpy/pyvenv-common |  

### III. Available text/Code viewer/editor, etc

| Function | usage| note |
| --- | --- | ---|
| text/python editor | `subl file` | sublime-text |
| text editor | `gedit file` | gedit |
| image viewer | `eog xxx.png` | eye of gnome |
| image viewer | `dispaly xxx.png` | imagemagick | 
| pdf viewer | `evince xxx.pdf` | evince |
| pdf viewer | `okular xxx.pdf` | -- |
| pdf viewer | `masterpdfeditor5 xxx.pdf` | -- |
| code editor | `code ./` |visual studio code |
| python editor | `spyder xxx.py` | spyder |
| ipynb editor | `jupyter-notebook xxx.ipynb` | jupyter-notebook |
| markdown editor | `ghostwriter file` | ghostwriter |
| office(ppt,word,excell)	| `libreoffice xxx.odp` |libreoffice|
| vesta/VESTA  | vesta x.vasp | -- |
 
## II.  Homemade function, alias and utility
### III. function list 

> PS: implemented in "~/.yasconf/yasfunclib.sh"

  | name | function | note |
  | --- | --- | ---|
  | `dump2recycle` | dump waste to directory "~/recycle" | -- |
  | `ls-d` | list only directories | --|
  | `ls-f` | list only non-directories | -- |
  | `transfer` | transfer file to https://transfer.sh | -- |

## II. File transfer

* UPLOAD: `curl --upload-file xxx.tar.gz https//free.keep.sh` 
* DOWNLOAD: `curl -L url/xxx.tar.gz -o xxx.tar.gz` (ps: -L option must be enabled, that is why `wget` doesn't work)

## II.  Miscellaneous

* About vim editor, I created on purpose "~/.vimrc" file for vim configuration.
* About kuaita VPN, executed bin: "~/code_inst/clash/cwf", `alias clash='cfw'`.

