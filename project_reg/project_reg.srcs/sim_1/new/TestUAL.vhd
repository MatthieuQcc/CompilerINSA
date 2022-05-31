library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity TestUAL is
end TestUAL;

architecture Behavioral of TestUAL is

COMPONENT UAL is
PORT(
    A : in std_logic_vector(7 downto 0); 
    B : in STD_LOGIC_VECTOR (7 downto 0);
    S : out STD_LOGIC_VECTOR (7 downto 0);
    Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0); 
    --Flags 
    N : out STD_LOGIC;
    O : out STD_LOGIC;
    Z : out STD_LOGIC; 
    C : out STD_LOGIC
);
END COMPONENT;

-- signal...
signal t_A : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal t_B : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal t_S : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal t_Alu : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
signal t_N : STD_LOGIC := '0';
signal t_O : STD_LOGIC := '0';
signal t_Z : STD_LOGIC := '0';
signal t_C : STD_LOGIC := '0';

begin

    Label_uut: UAL PORT MAP (
    A => t_A,
    B => t_B,
    S => t_S,
    Ctrl_Alu => t_Alu,
    N => t_N,
    O => t_O,
    Z => t_Z,
    C => t_C

);

t_A <= "00000110"; --15
t_B <= "00000011"; --21
t_Alu <= "10";

end Behavioral;
