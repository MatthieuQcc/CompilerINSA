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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CheminDonnees is

end CheminDonnees;

architecture Behavioral of CheminDonnees is

    COMPONENT memoire_instructions is
        Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
               CLK : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (31 downto 0)
               );
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
               QB : out STD_LOGIC_VECTOR (7 downto 0)
               );
    end COMPONENT;
    
    COMPONENT UAL is 
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Ctrl_Alu : in STD_LOGIC_VECTOR (1downto 0);
               N : out STD_LOGIC := '0';
               O : out STD_LOGIC := '0';
               Z : out STD_LOGIC := '0';
               C : out STD_LOGIC := '0';
               S : out STD_LOGIC_VECTOR (7 downto 0)
               );
    end COMPONENT;
    
    
    COMPONENT memoire_donnees is
        Port ( add : in STD_LOGIC_VECTOR (7 downto 0);
               input : in STD_LOGIC_VECTOR (7 downto 0);
               RW : in STD_LOGIC;
               RST : in STD_LOGIC;
               CLK : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (7 downto 0)
               );
    end COMPONENT;
    
    
    --pipeline LI/DI
    signal LI_DI_A : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal LI_DI_OP : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal LI_DI_B : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal LI_DI_C : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    
    --Pipeline DI/EX        
    signal DI_EX_A : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal DI_EX_OP : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal DI_EX_B : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal DI_EX_C : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
            
    --Pipeline EX/MEM        
    signal EX_MEM_A : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal EX_MEM_OP : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal EX_MEM_B : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
            
    --Pipeline MEM/RE
    signal MEM_RE_A : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal MEM_RE_OP : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal MEM_RE_B : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    
    --Pointeur d'instruction
    signal IP : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    
    --Comparateur logique RE (cinquieme etage)
    signal LC_RE : STD_LOGIC := '0';
    
    --premier etage
    signal output_mi: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    
    --Deuxieme etage
    signal MUX_QA : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal QB_banc: STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    
    --Troisieme etage
    signal MUX_S : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal LC_EX : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    
    --Quatrieme etage
    signal MUX_OUT_MD : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal LC_MEM : STD_LOGIC := '0';
    signal MUX_IN_MD : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    
    signal CLK_cpu : STD_LOGIC := '0'; 
    signal rst_cpu : STD_LOGIC := '1';
    signal output_cpu : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    
    -- Clock period definition
    constant Clock_period: time := 100 ns;
    
    begin
    
        --Clock process definition 
        Clock_process : process 
        
        begin 
            CLK_cpu <= not(CLK_cpu);
            wait for Clock_period/2;
        end process;
    
    
    --Premier etage 
    mem_instru : memoire_instructions port Map (
        add => IP,
        CLK => CLK_cpu,
        output => output_mi
    );
    --Cinquieme etage
           banc : banc_registre port Map (
               add_A => LI_DI_B(3 downto 0),
               add_B => LI_DI_C(3 downto 0),
               add_W => MEM_RE_A(3 downto 0),
               W => LC_RE,
               DATA => MEM_RE_B,
               RST => rst_cpu,
               CLK => CLK_cpu,
               QA => MUX_QA,
               QB => QB_banc
               );
               
           --Deuxieme etage    
           alu : UAL port MAP (
               A => DI_EX_B, 
               B => DI_EX_C,
               Ctrl_Alu => LC_EX,
               S => MUX_S
               );
           
           mem_donnees : memoire_donnees port Map (
               add => EX_MEM_B,
               input => MUX_IN_MD,
               RW => LC_MEM,
               RST => RST_cpu,
               CLK => CLK_cpu,
               output => MUX_OUT_MD
               );
        
   
    
    process
    begin
         wait until CLK_cpu'event and CLK_cpu='1';
   -- end process;
    
    --Place les données d'instruction dans le pipeline LI/DI
    --process
    --begin
    --Premier etage 
    --Format d'instruction : |OP|A|B|C|
    LI_DI_A <= output_mi(23 downto 16);
    LI_DI_OP <= output_mi(31 downto 24);
    LI_DI_B <= output_mi(15 downto 8);
    LI_DI_C <= output_mi(7 downto 0);
    --end process;
    
    output_cpu <= MEM_RE_A;
    IP <= IP + 1;
    
   --propage les données dans le pipeline DI/EX
   --process
   --begin
    DI_EX_A <= LI_DI_A;
    DI_EX_OP <= LI_DI_OP;
    --end process;
    
    --gere l'instruction AFC
    --process
    --begin
    if LI_DI_OP = x"6" or LI_DI_OP = x"7" then 
    --Si instruction AFC ou LOAD
        DI_EX_B <= LI_DI_B ;
    else 
    --Pour toutes les autres instructions
        DI_EX_B  <= MUX_QA; --permet de coder COP
    end if;
    DI_EX_C <= QB_banc;
    --end process;
    
    
    --propage les données dans le pipeline EX/MEM
    --process
    --begin
    EX_MEM_A <= DI_EX_A;
    EX_MEM_OP <= DI_EX_OP;
    
    if DI_EX_OP < x"4" or DI_EX_OP > x"0" then
        LC_EX <= DI_EX_OP(1 downto 0);
    else 
        LC_EX <= "00";
    end if;
    
   -- process
    --begin
    --Cas des instructions ADD,MUL,SOU
    if (EX_MEM_OP < x"4") or (EX_MEM_OP > x"0") then 
        EX_MEM_B <= MUX_S;
    else
    --Pour le reste des instructions 
        EX_MEM_B <= DI_EX_B;    
    end if;
   -- end process;
    
    --propage les données dans le pipeline MEM/RE
   -- process
   -- begin
   
        MEM_RE_A <= EX_MEM_A;
        MEM_RE_OP <= EX_MEM_OP; 
        if EX_MEM_OP = x"8" then 
            LC_MEM <= '0';
        else 
            LC_MEM <= '1';
        end if;
    --end process;
    
    
    --process
    --begin
    
    --instruction LOAD
    if MEM_RE_OP = x"7" then 
        MEM_RE_B <= MUX_OUT_MD;
    else
        MEM_RE_B <= EX_MEM_B;
    end if;
    --end process;
    
    --process
    --begin
    --Instruction STORE
    if MEM_RE_OP = x"8" then 
        MUX_IN_MD <= EX_MEM_A;
    else
        MUX_IN_MD <= EX_MEM_B;
    end if;
    
    if MEM_RE_OP = x"0" or MEM_RE_OP = x"8" then
        LC_RE <= '0';
    else 
        LC_RE <= '1';
    end if;
    
    end process;
     

end Behavioral;
