for component_part in ~/.bash/{aliases,configs,functions}/*; do
  source $component_part
done

if [ -f "${HOME}/.bashrc" ];
then
  . "${HOME}/.bashrc"
fi
