.PHONY: all serve build clean status

# 默认：提交并推送
all:
	git add .
	git diff --cached --quiet || git commit -m "update blog"
	git push

# 本地预览
serve:
	hugo server

# 本地构建测试
build:
	hugo --minify

# 清理构建文件
clean:
	rm -rf public resources/_gen

# 查看状态
status:
	git status
