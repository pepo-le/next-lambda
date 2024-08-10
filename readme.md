# Next.jsをLambdaで動かすためのサンプル

## 実施内容抜粋

- Next.js に Standalone ビルド設定を追加
- Next.js ビルド用の Dockerfile に `public.ecr.aws/awsguru/aws-lambda-adapter` の COPY を追加
- ECR を指定して Lambda を構築（Function URL を有効化）
- Lambda の ENI に ElasticIP を割り当て（外部リソースを扱えるように）
- CloufFront を構築（Lambda の Function URL をオリジンとして指定）
