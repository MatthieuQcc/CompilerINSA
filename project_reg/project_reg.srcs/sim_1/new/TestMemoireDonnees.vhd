----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2022 10:52:44
-- Design Name: 
-- Module Name: TestMemoireDonnees - Behavioral
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestMemoireDonnees is
end TestMemoireDonnees;

architecture Behavioral of TestMemoireDonnees is 

COMPONENT memoire_donnees is
    Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
           input : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

--Inputs
    signal t_add : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal t_input : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
    signal t_RW : STD_LOGIC ;
    signal t_RST : STD_LOGIC;
    signal t_CLK : STD_LOGIC := '0';
    
--Outputs
    signal t_output : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');

--Clock period definition
    constant Clock_period : time := 10ns;

begin

mem_donnees:  memoire_donnees PORT MAP(
    add => t_add,
    input => t_input,
    RW => t_RW,
    RST => t_RST,
    CLK =>  t_CLK,
    output => t_output
);

--Clock process definitions
Clock_process : process
begin 
    t_CLK <= not(t_CLK);
    wait for Clock_period/2;
end process; 

t_add <= "00000000" ;
t_input <= "11111111";
t_RW <= '0' after 10ns, '1' after 100 ns;
t_RST <= '1';

end Behavioral;
