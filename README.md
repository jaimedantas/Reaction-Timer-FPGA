# Reaction Timer for FPGA
This project mensures the time reaction of a human being in a Field-Programmable Gate Array (FPGA). When it initializes, a LED sinalizes the event and as soon as the LED goes off, the timer starts.  

##Altera FPGA
![](https://github.com/jaimedantas/Reaction-Timer-FPGA/blob/master/fpga_image.png)

All the code was made in low level and all the operations were implemented in VHDL. Also, the processor was created to execute the instructions. The figure below show the block diagram of the project.

![](https://github.com/jaimedantas/Reaction-Timer-FPGA/blob/master/controle.jpg)

The finite state machine is shown in the figure below.

![](https://github.com/jaimedantas/Reaction-Timer-FPGA/blob/master/maquina_finitas.jpg)
