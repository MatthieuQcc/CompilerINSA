----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 12:06:22
-- Design Name: 
-- Module Name: alu_test - Behavioral
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


architecture Behavioral of alu_test is
    component compiler_fpga is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
               B : in STD_LOGIC_VECTOR (15 downto 0);
               Ctrl_Alu : in STD_LOGIC_VECTOR (3 downto 0);
               N : out STD_LOGIC;
               O : out STD_LOGIC;
               Z : out STD_LOGIC;
               C : out STD_LOGIC;
               S : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal A_local : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal B_local : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
begin


end Behavioral;
