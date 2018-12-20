require 'spec_helper'

describe CoinbasePrime::Exchange do
  before :all do
    @client = CoinbasePrime::Exchange::Client.new 'api_pass', 'api_key', 'api_secret'
  end

  it "raises BadRequestError on 400" do
    stub_request(:get, /.*/)
      .to_return(body: mock_item.to_json, status: 400)
    expect { @client.orders }.to raise_error CoinbasePrime::Exchange::BadRequestError
  end

  it "raises NotAuthorizedError on 401" do
    stub_request(:get, /.*/)
      .to_return(body: mock_item.to_json, status: 401)
    expect { @client.orders }.to raise_error CoinbasePrime::Exchange::NotAuthorizedError
  end

  it "raises ForbiddenError on 403" do
    stub_request(:get, /.*/)
      .to_return(body: mock_item.to_json, status: 403)
    expect { @client.orders }.to raise_error CoinbasePrime::Exchange::ForbiddenError
  end

  it "raises NotFoundError on 404" do
    stub_request(:get, /.*/)
      .to_return(body: mock_item.to_json, status: 404)
    expect { @client.orders }.to raise_error CoinbasePrime::Exchange::NotFoundError
  end

  it "raises RateLimitError on 429" do
    stub_request(:get, /.*/)
      .to_return(body: mock_item.to_json, status: 429)
    expect { @client.orders }.to raise_error CoinbasePrime::Exchange::RateLimitError
  end

  it "raises InternalServerError on 500" do
    stub_request(:get, /.*/)
      .to_return(body: mock_item.to_json, status: 500)
    expect { @client.orders }.to raise_error CoinbasePrime::Exchange::InternalServerError
  end
end
