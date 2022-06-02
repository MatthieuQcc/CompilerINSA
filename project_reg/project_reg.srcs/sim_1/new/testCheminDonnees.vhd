----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2022 09:39:11
-- Design Name: 
-- Module Name: testCheminDonnees - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testCheminDonnees is
   
  
end testCheminDonnees;

architecture Behavioral of testCheminDonnees is

    COMPONENT CheminDonnees Port (
    --signal d'horloge
        CLK_cpu : in STD_LOGIC;
        --signal de reset
        rst_cpu : in STD_LOGIC    
        );
    end component;
        

    signal t_CLK : STD_LOGIC := '0';
    signal t_rst : STD_LOGIC := '0';
 
 --Clock period definition   
 constant Clock_period : time := 10ns;
 
begin
    chemin : CheminDonnees PORT MAP (
        CLK_cpu => t_CLK,
        rst_cpu => t_rst
        );
   
   t_rst <= '0', '1' after 50ns;
   
   --Clock process definitions
   Clock_process : process
   begin 
       t_CLK <= not(t_CLK);
       wait for Clock_period/2;
   end process; 


end Behavioral;
