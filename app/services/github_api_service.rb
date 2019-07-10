# frozen_string_literal: true

# GithubApiService calls for Github APIs
class GithubApiService
  def initialize(token)
    @token = token
  end

  def repository_info
    get_json('/user/repos')
  end

  def follower_info
    get_json('/user/followers')
  end

  def following_info
    get_json('/user/following')
  end

  def invitee_email(github_handle)
    get_json("users/#{github_handle}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.github.com') do |f|
      f.adapter Faraday.default_adapter
      f.headers['Authorization'] = "token #{@token}"
    end
  end
end
