----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.05.2022 09:59:31
-- Design Name: 
-- Module Name: banc_registre - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity banc_registre is
    Port ( add_A : in STD_LOGIC_VECTOR (3 downto 0);
           add_B : in STD_LOGIC_VECTOR (3 downto 0);
           add_W : in STD_LOGIC_VECTOR (3 downto 0);
           W : in STD_LOGIC;
           DATA : in STD_LOGIC_VECTOR (7 downto 0);
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           QA : out STD_LOGIC_VECTOR (7 downto 0);
           QB : out STD_LOGIC_VECTOR (7 downto 0));
end banc_registre;

architecture Behavioral of banc_registre is
    -- signaux internes
    type bancReg is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0); 
    --Initialisation du tableau
    signal banc : bancReg:=(others => (others => '0'));
    
begin
    process
    begin
        --Attend le front montant de l'horloge
        wait until CLK'event and CLK='1';
        
        --Si le signal RST est actif (à 0)
        if (RST = '0') then
            -- initialise le contenu du banc à 0x00
            banc(0 to 15) <= (others => X"00");
        end if;
        
        -- Si ecriture activée 
        if( W = '1') then 
            --copie données de DATA dans le registre d'adresse add_W
            banc(to_integer(unsigned(add_W))) <= DATA;
        end if;    
        
    end process;
    
    QA <= banc(to_integer(unsigned(add_A)));
    QB <= banc(to_integer(unsigned(add_B)));

end Behavioral;
