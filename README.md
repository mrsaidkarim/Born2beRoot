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

### What is AppArmor?
AppArmor provides Mandatory Access Control (MAC) security. In fact, AppArmor allows the system administrator to restrict the actions that processes can perform. For example, if an installed application can take photos by accessing the camera application, but the administrator denies this privilege, the application will not be able to access the camera application. If a vulnerability occurs (some of the restricted tasks are performed), AppArmor blocks the application so that the damage does not spread to the rest of the system.
In AppArmor, processes are restricted by profiles. Profiles can work in complain-mode and in enforce-mode. In enforce mode, AppArmor prohibits applications from performing restricted tasks. In complain-mode, AppArmor allows applications to do these tasks, but creates a registry entry to display the complaint.

### What is the difference between Apt and Aptitute?
apt and aptitude are tools for managing software packages on Debian-based systems, aptitude is considered a higher-level tool with additional features, including more advanced dependency resolution and automatic cleanup of unused packages. apt, as the lower-level tool, is more focused on executing explicit commands provided by the user. some of the key differences:
- Aptitude is a high-level package manager while APT is lower level which can be used by other higher level package managers.
- Aptitude is smarter and will automatically remove unused packages or suggest installation of dependent packages.
- Apt will only do explicitly what it is told to do in the command line.

### How to use SSH?
SSH or Secure Shell is a remote administration protocol that allows users to control and modify their servers over the Internet thanks to an authentication mechanism. Provides a mechanism to authenticate a user remotely, transfer data from the client to the host, and return a response to the request made by the client.
SSH was created as an alternative to Telnet, which does not encrypt the information that is sent. SSH uses encryption techniques to ensure that all client-to-host and host-to-client communications are done in encrypted form. One of the advantages of SSH is that a user using Linux or MacOS can use SSH on their server to communicate with it remotely through their computer's terminal. Once authenticated, that user will be able to use the terminal to work on the server.

There are three different techniques that SSH uses to encrypt:
- ***Symmetric encryption***: a method that uses the same secret key for both encryption and decryption of a message, for both the client and the host. Anyone who knows the password can access the message that has been transmitted.
- ***Asymmetric encryption***: uses two separate keys for encryption and decryption. These are known as the public key and the private key. Together, they form the public-private key pair.
- ***Hashing***: another form of cryptography used by SSH. Hash functions are made in a way that they don't need to be decrypted. If a client has the correct input, they can create a cryptographic hash and SSH will check if both hashes are the same.

The command used to connect to a server with ssh is:

    ssh {username}@{IP_host} -p {port}

### Cron & Wall:

**Cron**: Linux task manager that allows us to execute commands at a certain time. We can automate some tasks just by telling cron what command we want to run at a specific time. For example, if we want to restart our server every day at 4:00 am, instead of having to wake up at that time, cron will do it for us.

**Wall**: command used by the root user to send a message to all users currently connected to the server. If the system administrator wants to alert about a major server change that could cause users to log out, the root user could alert them with wall.

### TCP & UDP:

There are two main protocols for transporting data between devices: TCP (Transmission Control Protocol) and UDP (User Datagram Protocol). Each protocol uses port numbers differently:

*TCP*: Provides reliable, connection-oriented communication. It ensures that data is delivered in the correct order and without errors.

*UDP*: Provides a connectionless, lightweight communication method. It's faster but doesn't guarantee delivery or order.

### Bonus Part:

- User Requests a Page: When a user accesses your WordPress site through their web browser, a request is sent to the VM's IP address.
- Lighttpd Receives the Request: Lighttpd, being the web server, receives the request. If it's for a static file (like an image or CSS file), lighttpd serves it directly. If it's for a PHP file (like index.php), lighttpd forwards the request to the PHP interpreter.
- PHP Processes the Request: PHP processes the PHP script, interacting with the MariaDB database as needed. It generates the dynamic content for the requested page.
- Response Sent to User: The dynamic content is sent back to lighttpd through FastCGI, and then lighttpd sends the final response to the user's web browser.
- MariaDB Handles Database Operations: If the PHP script involves database operations (e.g., retrieving blog posts), MariaDB manages these operations and provides the necessary data to PHP.
