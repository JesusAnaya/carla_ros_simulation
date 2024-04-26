import carla
import argparse

parser = argparse.ArgumentParser(description='Process to setup the Carla server scenario')
parser.add_argument('--host', type=str, help='Host to connect to the Carla server')


def main():
    args = parser.parse_args()
    client = carla.Client(args.host, 2000)
    client.set_timeout(200.0)

    world = client.get_world()

    # Get the current weather parameters
    weather = world.get_weather()

    # Set the desired parameters
    weather.cloudiness = 90.0
    weather.precipitation = 0.0
    weather.precipitation_deposits = 40.0
    weather.fog_density = 0.0
    weather.sun_altitude_angle = 70.0

    # Apply the new weather parameters
    world.set_weather(weather)

    print('Weather parameters set successfully')


if __name__ == "__main__":
    main()
