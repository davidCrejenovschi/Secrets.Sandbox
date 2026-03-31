import requests

def get_user_data():
    github_token = "ghp_AbCdEfGhIjKlMnOpQrStUvWxYz1234567890"
    
    headers = {
        "Authorization": f"Bearer {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }
    
    response = requests.get("https://api.github.com/user", headers=headers)
    return response.json()
