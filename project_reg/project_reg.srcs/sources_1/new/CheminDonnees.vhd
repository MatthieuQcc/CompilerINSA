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
        
        --signal d'horloge
        CLK_cpu : in STD_LOGIC;
        --signal de reset
        rst_cpu : in STD_LOGIC;
        --Sortie finale
        output_final : out STD_LOGIC_VECTOR (31 downto 0)
        );

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
               Ctrl_Alu : in STD_LOGIC_VECTOR (1 downto 0);
               N : out STD_LOGIC;
               O : out STD_LOGIC;
               Z : out STD_LOGIC;
               C : out STD_LOGIC;
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
    signal LI_DI_A : STD_LOGIC_VECTOR (7 downto 0);
    signal LI_DI_OP : STD_LOGIC_VECTOR (7 downto 0);
    signal LI_DI_B : STD_LOGIC_VECTOR (7 downto 0);
    signal LI_DI_C : STD_LOGIC_VECTOR (7 downto 0);
    
    --Pipeline DI/EX        
    signal DI_EX_A : STD_LOGIC_VECTOR (7 downto 0);
    signal DI_EX_OP : STD_LOGIC_VECTOR (7 downto 0);
    signal DI_EX_B : STD_LOGIC_VECTOR (7 downto 0);
            
    --Pipeline EX/MEM        
    signal EX_MEM_A : STD_LOGIC_VECTOR (7 downto 0);
    signal EX_MEM_OP : STD_LOGIC_VECTOR (7 downto 0);
    signal EX_MEM_B : STD_LOGIC_VECTOR (7 downto 0);
            
    --Pipeline MEM/RE
    signal MEM_RE_A : STD_LOGIC_VECTOR (7 downto 0);
    signal MEM_RE_OP : STD_LOGIC_VECTOR (7 downto 0);
    signal MEM_RE_B : STD_LOGIC_VECTOR (7 downto 0);
    
    --Pointeur d'instruction
    signal IP : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    
    --Comparateur logique RE
    signal LC_RE : STD_LOGIC := '0';
    
    
    begin
    
    mem_instru : memoire_instructions port Map (
        add => IP,
        CLK => CLK_cpu,
        output => output_final
    );
    
    banc : banc_registre port Map (
        add_A => (others => '0'),
        add_B => (others => '0'),
        add_W => MEM_RE_A(3 downto 0),
        W => LC_RE,
        DATA => MEM_RE_B,
        RST => rst_cpu,
        CLK => CLK_cpu
        );
        
    --ual : UAL port MAP (
    -- );
    
    
        
    
    
    

end Behavioral;
