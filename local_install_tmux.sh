#!/bin/bash

# 判断文件是否存在
function is_exist_file()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# 获取日期
function get_datetime()
{
    time=$(date "+%Y%m%d%H%M%S")
    echo $time
}

#备份原有的.tmux.conf文件
function backup_tmux_conf_file()
{
    old_tmux_conf=$HOME"/.tmux.conf"
    is_exist=$(is_exist_file $old_tmux_conf)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_tmux_conf=$old_tmux_conf"_bak_"$time
        ch="Y"
        read -p "Find "$old_tmux_conf" already exists, backup "$old_tmux_conf" to "$backup_tmux_conf"? [Y/N] " ch
        if [ -z $ch ] || [ $ch == "Y" ] || [ $ch == "y" ]; then
            cp $old_tmux_conf $backup_tmux_conf
        fi
    fi
}

function backup_tmux_conf_local_file()
{
    old_tmux_conf_local=$HOME"/.tmux.conf.local"
    is_exist=$(is_exist_file $old_tmux_conf_local)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_tmux_conf_local=$old_tmux_conf_local"_bak_"$time
        read -p "Find "$old_tmux_conf_local" already exists, backup "$old_tmux_conf_local" to "$backup_tmux_conf_local"? [Y/N] " ch
        if [ -z $ch ] || [ $ch == "Y" ] || [ $ch == "y" ]; then
            cp $old_tmux_conf_local $backup_tmux_conf_local
        fi
    fi    
}

function backup_tmux_file()
{
    backup_tmux_conf_file
    backup_tmux_conf_local_file
}

# 拷贝文件
function copy_files()
{
    rm -rf $HOME"/.tmux.conf"
    ln -s -f ${PWD}/.tmux/.tmux.conf $HOME

    rm -rf $HOME"/.tmux.conf.local"
    cp ${PWD}/.tmux/.tmux.conf.local $HOME
}


function main()
{
    echo "#############################################################################################"
    read -p "Ready to install oh-my-tmux, dou you want to install it? [Y/N] " ch
    if [[ $ch == "N" ]] || [[ $ch == "n" ]]; then
        echo "Oh-my-tmux is installed failed!"
        return
    fi

    backup_tmux_file
    copy_files

    echo -e "\n"
    echo "#############################################################################################"
    echo "Oh-my-tmux (https://github.com/gpakosz/.tmux) has been installed successfully, just enjoy it!"
    echo "#############################################################################################"
    echo -e "\n"
}

main
