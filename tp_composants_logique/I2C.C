void I2C1_WriteByte(uint8_t address, uint8_t data)
{
    /* Attendre que le bus soit libre */
    while (I2C1->SR2 & I2C_SR2_BUSY);


    /* =========================================================
       START
       ========================================================= */

    I2C1->CR1 |= I2C_CR1_START;

    // Attendre SB = Start Bit
    while (!(I2C1->SR1 & I2C_SR1_SB));


    /* =========================================================
       Envoyer l'adresse + WRITE
       ========================================================= */

    /*
     * address est une adresse sur 7 bits.
     *
     * On décale d'un bit :
     *
     *  adresse
     *  7 bits
     *
     *  A6 A5 A4 A3 A2 A1 A0
     *
     * devient :
     *
     *  A6 A5 A4 A3 A2 A1 A0 0
     *                       ^
     *                       WRITE
     */

    I2C1->DR = (address << 1);


    /* Attendre que l'adresse ait été ACK */
    while (!(I2C1->SR1 & I2C_SR1_ADDR));


    /*
     * Pour effacer ADDR :
     *
     * lecture SR1
     * puis lecture SR2
     */

    (void)I2C1->SR1;
    (void)I2C1->SR2;


    /* =========================================================
       Envoyer la donnée
       ========================================================= */

    // Attendre que DR soit vide
    while (!(I2C1->SR1 & I2C_SR1_TXE));

    I2C1->DR = data;


    /*
     * BTF = Byte Transfer Finished
     *
     * DR est vide ET le shift register a fini.
     */

    while (!(I2C1->SR1 & I2C_SR1_BTF));


    /* =========================================================
       STOP
       ========================================================= */

    I2C1->CR1 |= I2C_CR1_STOP;
}

uint8_t I2C1_ReadByte(uint8_t address)
{
    uint8_t data;


    /* Attendre que le bus soit libre */
    while (I2C1->SR2 & I2C_SR2_BUSY);


    /* =========================================================
       On veut recevoir UN SEUL octet.

       Donc le maître doit envoyer NACK après cet octet.
       ========================================================= */

    I2C1->CR1 &= ~I2C_CR1_ACK;


    /* =========================================================
       START
       ========================================================= */

    I2C1->CR1 |= I2C_CR1_START;

    while (!(I2C1->SR1 & I2C_SR1_SB));


    /* =========================================================
       Adresse + READ

       bit 0 = 1
       ========================================================= */

    I2C1->DR = (address << 1) | 1;


    /* Attendre ADDR */
    while (!(I2C1->SR1 & I2C_SR1_ADDR));


    /* Effacer ADDR */
    (void)I2C1->SR1;
    (void)I2C1->SR2;


    /*
     * Puisque l'on veut seulement UN octet,
     * on prépare immédiatement le STOP.
     */

    I2C1->CR1 |= I2C_CR1_STOP;


    /* =========================================================
       Attendre la réception
       ========================================================= */

    while (!(I2C1->SR1 & I2C_SR1_RXNE));


    data = (uint8_t)I2C1->DR;


    return data;
}