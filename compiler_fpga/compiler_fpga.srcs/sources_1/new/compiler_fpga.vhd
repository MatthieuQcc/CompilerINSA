----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 10:28:40
-- Design Name: 
-- Module Name: compiler_fpga - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compiler_fpga is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (3 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0));
end compiler_fpga;

architecture Behavioral of compiler_fpga is
    signal S_aux : std_logic_vector(31 downto 0) := (others => '0');
begin
    process (Ctrl_Alu, A, B) 
    begin
        S_aux <= ((x"00" & A) + (x"00" & B)) when Ctrl_Alu = ('0', '0', '0') else
        ((x"00" & A) - (x"00" & B)) when Ctrl_Alu = ('0', '0', '1') else
        std_logic_vector(to_unsigned(to_integer(unsigned(x"00" & A)) / to_integer(unsigned(x"00" & B)), 16)) when Ctrl_Alu = ('0', '1', '0') else
        (A * B) when Ctrl_Alu = ('0', '1', '1');
    end process;
    
    S <= S_aux(15 downto 0);
    C <= '1' when S_aux(16) = '1';
    Z <= '1' when S_aux = (others => '0');

end Behavioral;
