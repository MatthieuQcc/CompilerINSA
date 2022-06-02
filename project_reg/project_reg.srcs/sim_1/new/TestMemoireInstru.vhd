----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2022 10:52:44
-- Design Name: 
-- Module Name: TestMemoireInstru - Behavioral
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

entity TestMemoireInstru is
    
end TestMemoireInstru;

architecture Behavioral of TestMemoireInstru is

COMPONENT memoire_instructions 
    Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0)
           );
end Component;

--Clock period definition   
 constant Clock_period : time := 100ns;
 
 signal add : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
 signal t_CLK : STD_LOGIC := '1';
 signal output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
 
 
begin

mem_instru : memoire_instructions Port Map (
    add => add,
    CLK => t_CLK,
    output => output
 );
 
 --Clock process definitions
  Clock_process : process
  begin 
      t_CLK <= not(t_CLK);
      wait for Clock_period/2;
  end process; 
 
 process
 begin
    
    add <= x"01" after 5ns, x"02" after 10ns;
 
 end process;


end Behavioral;
