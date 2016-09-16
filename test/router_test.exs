defmodule RacklaSkeleton.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts RacklaSkeleton.Router.init([])

  @test_router_port 4444
  Plug.Adapters.Cowboy.http(RacklaSkeleton.Router, [], port: @test_router_port)

  test "Hello, world!" do
    conn =
      :get
      |> conn("/hello")
      |> RacklaSkeleton.Router.call(@opts)

    assert conn.status == 200
    assert conn.scheme == :http
    assert conn.method == "GET"
    assert conn.resp_body == "Hello, world!"
  end

  test "Hello, JSON!" do
    conn =
      :get
      |> conn("/hello-json")
      |> put_req_header("accept-encoding", "gzip")
      |> RacklaSkeleton.Router.call(@opts)

    assert conn.status == 200
    assert conn.scheme == :http
    assert conn.method == "GET"
    assert get_resp_header(conn, "content-encoding") == ["gzip"]
    assert :zlib.gunzip(conn.resp_body) |> Poison.decode! == %{"hello" => "world!"}
  end
end