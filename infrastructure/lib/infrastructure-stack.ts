import { Stack, StackProps } from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as codepipeline from 'aws-cdk-lib/aws-codepipeline';


export class InfrastructureStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

	const pipeline = new codepipeline.Pipeline(this, 'MyFirstPipeline', {
  crossAccountKeys: false,
});
  }
}
