### 1. Update the system clock

- `timedatectl status` to check time
- `timedatectl set-ntp true` to sync time

### 2. Partition disk

- `fdisk -l` to list all disk available
- `cfdisk /dev/*disk-name-wish-to-install*` using cfdisk to partition

### 3. Format partition

- `mkfs.fat -F32 /dev/*boot-partition*` to format EFI boot partition
- `mkfs.ext4 /dev/*system-partition*` to format filesystem partition
- `mkswap /dev/*swap-partition*` to format swap

### 4. Mount

- `mount /dev/*system-partition* /mnt` to mount the file system
- `swapon /dev/*swap-partition*` to tell linux this is swap partition

### 5. Generate package mirror and install nessesary package

- `reflector --download-timeout 60 --country US --age 12 --protocol https --sort rate` to sort mirror pacman
- `pacman -Sy` to update package
- `pacstrap /mnt base base-devel linux linux-firmware sudo networkmanager neovim` to install arch

### 5. Configure Arch Linux

- `genfstab -U /mnt >> /mnt/etc/fstab` to generate fstab file
- `arch-chroot /mnt` to login to system
- `ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime` timezone config
- `nvim /etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`
- `locale-gen` run
- `echo LANG=en_US.UTF-8 >> /etc/locale.conf`
- `echo ARC >> /etc/hostname` host name will be
- `nvim /etc/hosts` and add:
- ```bash
  127.0.0.1        localhost
  ::1              localhost
  127.0.1.1        ARC
  ```
- `systemctl enable NetworkManager` to permission
- `passwd` to root password
- `useradd -m -G wheel kay` create non-root user

- `passwd kay` pass for kay user
- `nvim /etc/sudoers/` and uncomment `# %wheel ALL=(ALL:ALL) ALL`
- `pacman -S intel-ucode`

### 6. Install Bootloader

- `pacman -S grub efibootmgr`
- `mkdir /boot/efi`
- `mount /dev/*boot-partition* /boot/efi`
- `grub-install --target=x86_64-efi --bootloader-id=ARCH-BOOTLOADER` install grub
- `grub-mkconfig -o /boot/grub/grub.cfg` generate config file

### 7. Graphic Driver Install

- `pacman -S nvidia xf86-video-intel`

### 8. Finalize

- ```bash
  exit
  umount -R /mnt
  reboot
  ```
