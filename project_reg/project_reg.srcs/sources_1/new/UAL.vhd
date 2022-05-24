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

entity UAL is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0);
           N : out STD_LOGIC;
           O : out STD_LOGIC;
           Z : out STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0));
end UAL;

architecture Behavioral of UAL is

    signal S_aux : std_logic_vector(15 downto 0) := (others => '0');
    
begin

    process
    
        begin
            case Ctrl_Alu is
            when "00" => S_aux <= ((x"00" & A) + (x"00" & B));
            when "01" => S_aux <= ((x"00" & A) - (x"00" & B));
            when "10" => S_aux <= (A * B);
            when "11" => S_aux <=  std_logic_vector(to_unsigned(to_integer(unsigned(x"00" & A)) / to_integer(unsigned(x"00" & B)), 16));
        end case;  
     end process;
    
    
    
    N <= '1' when Ctrl_Alu = x"01" and A<B else '0';--peut etre <0 que dans la cas d'une soustraction ou A<B
    O <= '1' when Ctrl_Alu = x"10" and S_aux > x"00ff" else '0';--dans le cas d'une multiplication, résultat dépasse 8bits
    Z <= '1' when S_aux = x"00" else '0' ;
    C <= '1' when Ctrl_Alu = x"00" and S_aux > x"00ff" else '0'; --dans le cas d'une addition, résultat dépasse 8bits
    
    S <= S_aux(7 downto 0); --garde que les 8 premiers bits de S_aux

end Behavioral;