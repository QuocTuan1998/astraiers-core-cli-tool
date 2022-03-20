#!/bin/bash

pkgs_git_thanhntmany="
type=git
git_username=~/thanhntmanyasdads
"

type=local
git_username=~/.ass/repository

echo ---------------
echo $type
echo $git_username

echo ---------------
eval "$pkgs_git_thanhntmany"
echo $type
echo $git_username

echo =================
