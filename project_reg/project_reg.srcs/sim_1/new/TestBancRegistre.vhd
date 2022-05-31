----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2022 11:07:46
-- Design Name: 
-- Module Name: TestBancRegistre - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBancRegistre is
end TestBancRegistre ;

architecture Behavioral of TestBancRegistre is

COMPONENT banc_registre is
    Port ( add_A : in STD_LOGIC_VECTOR (3 downto 0);
           add_B : in STD_LOGIC_VECTOR (3 downto 0);
           add_W : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

-- Inputs
    signal t_add_A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal t_add_B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal t_add_W : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal t_W : STD_LOGIC := '0';
    signal t_DATA : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal t_RST : STD_LOGIC := '1';
    signal t_CLK : STD_LOGIC := '0';
    
 -- Outputs
    signal t_QA : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal t_QB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    --Clock period definition
    constant Clock_period : time := 10ns;
    
begin
    
-- Instantiate the Unit Under Test (UUT)
Label_uut:  banc_registre PORT MAP(
    add_A => t_add_A, 
    add_B => t_add_B, 
    add_W => t_add_W, 
    W => t_W, 
    DATA => t_DATA, 
    RST => t_RST, 
    CLK => t_CLK,
    QA => t_QA,
    QB => t_QB
    );
    
--Clock process definitions
Clock_process : process
begin 
    t_CLK <= not(t_CLK);
    wait for Clock_period/2;
end process; 
    
t_add_A <= X"2";
t_add_B <= X"8";
t_add_W <= X"2";
t_DATA <= X"4F";


end Behavioral;
