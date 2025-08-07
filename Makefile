.PHONY: build deploy clean

# 生成到 docs/ 文件夹，适用于 GitHub Pages 项目站点
build:
	hugo -d docs

# 构建 + git 提交 + 推送
deploy: build
	git add .
	git commit -m "🚀 auto deploy"
	git push

# 清除生成的内容
clean:
	rm -rf docs/
