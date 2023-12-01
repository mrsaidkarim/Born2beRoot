# Born2beRoot
Born2Beroot is a project in the 42 cursus that focuses on setting up a secured and functional operating system. This project emphasizes system administration skills and requires the configuration of various services and security features.

### What is a Virtual Machine?
A virtual machine is a software capable of installing an Operating System within itself, making the OS think that it is hosted on a real computer. With virtual machines we can create virtual devices that will behave in the same way as physical devices, using their own CPU, memory, network interface and storage. This is possible because the virtual machine is hosted on a physical device, which is the one that provides the hardware resources to the VM. The software program that creates virtual machines is the hypervisor. The hypervisor is responsible for isolating the VM resources from the system hardware and making the necessary implementations so that the VM can use these resources.

#### Virtual machines offer several advantages, including:
- Different guest machines hosted on our computer can run different operating systems, so we will have different OS working on the same machine.
- They provide an environment in which to safely test unstable programs to see if they will affect the system or not.
- We reduce costs by reducing physical architecture.

### What is LVM?
LVM (Logical Volume Manager) is an abstraction layer between a storage device and a file system. We get many advantages from using LVM, but the main advantage is that we have much more flexibility when it comes to managing partitions. Suppose we create four partitions on our storage disk. If for any reason we need to expand the storage of the first three partitions, we will not be able to because there is no space available next to them. In case we want to extend the last partition, we will always have the limit imposed by the disk. In other words, we will not be able to manipulate partitions in a friendly way. Thanks to LVM, all these problems are solved.
By using LVM, we can expand the storage of any partition (now known as a logical volume) whenever we want without worrying about the contiguous space available on each logical volume. We can do this with available storage located on different physical disks (which we cannot do with traditional partitions). We can also move different logical volumes between physical devices. Of course, services and processes will work the same way they always have. But to understand all this, we have to know:
- Physical Volume (PV): physical storage device. It can be a hard disk, an SD card, a floppy disk, etc. This device provides us with storage available to use.
- Volume Group (VG): to use the space provided by a PV, it must be allocated in a volume group. It is like a virtual storage disk that will be used by logical volumes. VGs can grow over time by adding new VPs.
- Logical volume (LV): these devices will be the ones we will use to create file systems, swaps, virtual machines, etc. If the VG is the storage disk, the LV are the partitions that are made on this disk.

### What is a File System?
is a method an operating system uses to store, organize, and manage files and directories on a storage device.
Some common types of file systems: FAT, NTFS, EXT, HFS, APFS.
