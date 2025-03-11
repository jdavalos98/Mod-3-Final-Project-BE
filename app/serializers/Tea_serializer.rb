class TeaSerializer
  include JSONAPI::TeaSerializer

  attributes :title, :description, :temperature, :brew_time
end