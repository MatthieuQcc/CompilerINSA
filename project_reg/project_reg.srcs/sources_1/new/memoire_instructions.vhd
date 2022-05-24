----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2022 10:25:49
-- Design Name: 
-- Module Name: memoire_instructions - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoire_instructions is
    Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end memoire_instructions;

architecture Behavioral of memoire_instructions is
    type bancMem is array (0 to 255) of STD_LOGIC_VECTOR (7 downto 0); 
    --Initialisation du tableau
    signal memoire : bancMem:=(others => (others => '0'));

begin
    process
    begin
    
     --Attend le front montant de l'horloge pour la lecture
     wait until CLK'event and CLK='1';
     
     output <= memoire(to_integer(unsigned(add))) ;     
          
    end process;

end Behavioral;
