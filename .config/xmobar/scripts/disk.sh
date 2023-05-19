#!/bin/sh
freespace=$(btrfs fi usage / | grep -Po 'Free \(estimated\):.*' | awk '{print $3}')
echo "<fn=6></fn>  <fc=#AAC0F0> $freespace</fc>"
