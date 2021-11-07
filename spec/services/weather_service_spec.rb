RSpec.describe WeatherService do
  subject { WeatherService.new }

  let(:http_response) do
    "{\"coord\":{\"lon\":-0.1257,\"lat\":51.5085},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":276.71,\"feels_like\":274.28,\"temp_min\":274.21,\"temp_max\":279.2,\"pressure\":998,\"humidity\":94},\"visibility\":10000,\"wind\":{\"speed\":2.57,\"deg\":240},\"clouds\":{\"all\":9},\"dt\":1635836613,\"sys\":{\"type\":2,\"id\":2019646,\"country\":\"GB\",\"sunrise\":1635836152,\"sunset\":1635870730},\"timezone\":0,\"id\":2643743,\"name\":\"London\",\"cod\":200}"
  end

  it 'return cod' do
    # subject.stub(:get_data).and_return(http_response)
    allow(subject).to receive(:parse_data) { http_response }

    expect(subject.cod).to eq(200)
  end
end
