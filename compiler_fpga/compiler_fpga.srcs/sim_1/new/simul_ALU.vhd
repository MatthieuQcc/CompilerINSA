----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.04.2022 10:12:20
-- Design Name: 
-- Module Name: simul_ALU - Behavioral
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


--  Entree_1 <= '0' after n ns, '1' after n+m ns, '0' after n+m+p ns;
-- Entree_2_Vecteur_3bits <= "101" after m ns, "010" after m+p ns;

entity simul_ALU is
end simul_ALU;

architecture Behavioral of simul_ALU is

COMPONENT  compiler_fgpa
PORT(
    A : IN std_logic_vector(15 downto 0); --Entrée 1 de l'ALU
    B : in STD_LOGIC_VECTOR (15 downto 0); --Entrée 2 de l'ALU
    S : out STD_LOGIC_VECTOR (15 downto 0); --Sortie de l'ALU
    Ctrl_Alu : in STD_LOGIC_VECTOR (3 downto 0); --operations de l'ALU 
    --Flags 
    N : out STD_LOGIC; --Negative
    O : out STD_LOGIC; --Overload
    Z : out STD_LOGIC; --Zero
    C : out STD_LOGIC --Carry
);
END COMPONENT;

-- signal...
signal sig_A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sig_B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sig_S : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sig_Alu : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
signal sig_N : STD_LOGIC := '0';
signal sig_O : STD_LOGIC := '0';
signal sig_Z : STD_LOGIC := '0';
signal sig_C : STD_LOGIC := '0';

constant Clock_period : time := 10 ns;

begin

    Label_uut: compiler_fgpa PORT MAP (
    A => sig_A,
    B => sig_B,
    S => sig_S,
    Ctrl_Alu => sig_Alu,
    N => sig_N,
    O => sig_O,
    Z => sig_Z,
    C => sig_C

);

sig_A <= "00001111";
sig_B <= "00010101";
sig_Alu <= "00";

end Behavioral;

--Truc de registre : 
--type Banc is array (0 to 15) of std_logic_vector (7 downto 0)
--signal reg:borne
--begin 
--process  --ecriture
-- begin 
--wait until db 'event and dh = '1';
--if rst
-- else if 