defmodule CryptoCoins do

  # Se importa la clase CryptoCoins.Api la cual trae de la api todos los coins
  require CryptoCoins.Api

  def coin(coins, name) when is_binary(name) do
    # Con Enum.find se busca mediante la key name de cada coin del array coins que sea igual
    # al name pasado como parámetro
    Enum.find(coins, fn coin -> String.downcase(Map.fetch!(coin, "name")) == String.downcase(name) end)
  end

  def most_valuable(coins) do
    # Obtiene la moneda con el precio más alto del array coins donde se encuetra cada coin, comparando con el precio
    # de cada coin convertido a float.
    Enum.max_by(coins, fn coin -> Float.parse(Map.fetch!(coin, "price")) end)
  end

  def most_capped(coins) do
    # Obtiene la moneda con el precio más najo del array coins donde se encuetra cada coin, comparando con el precio
    # de cada coin convertido a float.
    Enum.max_by(coins, fn coin -> Map.fetch!(coin, "marketCap") end)
  end

  def most_ranked(coins) do
    # Obtiene la moneda con el rank menor del array coins donde se encuetra cada coin, comparando con el rank
    # de cada coin convertido a Intenger, se obtiene el menor ya que el rank más alto se considera el 1.
    Enum.max_by(coins, fn coin -> Map.fetch!(coin, "rank") end)
  end

  def sort_by(coins, field) do
    # Mediante sort_by se ordena cada coin en el array coins, obteniendo la key pasado como parametro
    # con field.
    Enum.sort_by(coins, fn coin -> Map.fetch!(coin, field) end)
  end
end
