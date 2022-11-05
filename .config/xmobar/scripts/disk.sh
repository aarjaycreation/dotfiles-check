#!/bin/sh
freespace=$(btrfs fi usage / | grep -Po 'Free \(estimated\):.*' | awk '{print $3}')
echo "Disk (Free): <fc=#AAC0F0> $freespace</fc>"
