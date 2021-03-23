user = PhoenixTrello.Repo.get_by(PhoenixTrello.User, email: "test1234@test.com")

PhoenixTrello.Guardian.encode_and_sign(user)
