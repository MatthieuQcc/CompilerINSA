----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2022 12:05:48
-- Design Name: 
-- Module Name: integration - Behavioral
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

entity integration is
end integration;

architecture Behavioral of integration is

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

COMPONENT memoire_donnees is
    Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
           input : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT memoire_instructions is
    Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

begin


end Behavioral;
