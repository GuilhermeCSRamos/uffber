class Viagem < ApplicationRecord
  belongs_to :motorista
  belongs_to :passageiro
end
