entity semaforo is
    port(
    sensorA : in bit;
    sensorB : in bit;
    lga : out bit;
    lgb : out bit;
    lra : out bit;
    lrb : out bit
);
end semaforo;

architecture comportamento of semaforo is
begin
    lga <= sensorA or not(sensorB);
    lrb <= sensorA or not(sensorB);
    lgb <= not(sensorA) and sensorB;
    lra <= not(sensorA) and sensorB;
end comportamento;
