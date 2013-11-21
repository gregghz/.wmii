#!/bin/zsh

echo -n '('`notmuch count tag:inbox and NOT tag:archive and tag:unread`')'
