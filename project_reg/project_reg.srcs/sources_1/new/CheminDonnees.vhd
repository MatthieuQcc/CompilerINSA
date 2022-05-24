----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.05.2022 11:28:16
-- Design Name: 
-- Module Name: CheminDonnees - Behavioral
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

entity CheminDonnees is
    Port(   
        
        LI_DI_A : inout STD_LOGIC_VECTOR (7 downto 0);
        LI_DI_OP : inout STD_LOGIC_VECTOR (7 downto 0);
        LI_DI_B : inout STD_LOGIC_VECTOR (7 downto 0);
        LI_DI_C : in STD_LOGIC_VECTOR (7 downto 0);
        DI_EX_A : inout STD_LOGIC_VECTOR (7 downto 0);
        DI_EX_OP : inout STD_LOGIC_VECTOR (7 downto 0);
        DI_EX_B : inout STD_LOGIC_VECTOR (7 downto 0);
        EX_MEM_A : inout STD_LOGIC_VECTOR (7 downto 0);
        EX_MEM_OP : inout STD_LOGIC_VECTOR (7 downto 0);
        EX_MEM_B : inout STD_LOGIC_VECTOR (7 downto 0);
        MEM_RE_A : inout STD_LOGIC_VECTOR (7 downto 0);
        MEM_RE_OP : inout STD_LOGIC_VECTOR (7 downto 0);
        MEM_RE_B : inout STD_LOGIC_VECTOR (7 downto 0)
                
        );

end CheminDonnees;

architecture Behavioral of CheminDonnees is

COMPONENT memoire_instructions is
    Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;


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



begin




end Behavioral;
