----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 09:55:54
-- Design Name: 
-- Module Name: Compteur - Behavioral
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

entity Compteur is
    Port ( Entree_1 : in STD_LOGIC;
           Entree_2 : in STD_LOGIC_VECTOR (3 downto 0);
           Sortie_1 : out STD_LOGIC;
           Sortie_2 : out STD_LOGIC_VECTOR (0 downto 0));
end Compteur;

architecture Behavioral of Compteur is

begin


end Behavioral;
