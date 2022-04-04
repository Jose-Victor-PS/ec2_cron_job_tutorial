import boto3


def handler(event, context):
    ec2 = boto3.client("ec2")
    response = ec2.describe_instances(
        Filters=[
            {
                'Name': "tag:Name",
                'Values': [
                    'my_tutorial_machine'
                ]
            }
        ]
    )

    instance_id = response['Reservations'][0]['Instances'][0]['InstanceId']

    response = ec2.start_instances(
        InstanceIds=[
            instance_id
        ]
    )
    print(response)


if __name__ == '__main__':
    handler({}, None)
