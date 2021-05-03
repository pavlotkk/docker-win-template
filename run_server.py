from demo import settings

if __name__ == "__main__":
    from demo.server.app import app

    app.run(
        host=settings.APP_HOST,
        port=settings.APP_PORT,
        debug=settings.APP_DEBUG
    )
