.PHONY: all serve build clean status sync continue

# =========================
# Project
# =========================

# 默认执行构建
all: serve

# 本地预览
serve:
	hugo server

# 本地构建测试
build:
	hugo --minify

# 清理构建文件
clean:
	rm -rf public resources/_gen


# =========================
# Git
# =========================

# 查看状态
status:
	git status
	git log --oneline --decorate --graph -5


# 同步：
# 1. 必须位于 dev
# 2. 自动提交未提交的修改
# 3. 更新本地 main
# 4. 将 dev rebase 到最新 main
# 5. rebase 成功后合并到 main 并推送
sync:
	@if [ "$$(git branch --show-current)" != "dev" ]; then \
		echo "Error: sync must be run on dev branch."; \
		exit 1; \
	fi
	@if [ -d "$$(git rev-parse --git-path rebase-merge)" ] || \
	   [ -d "$$(git rev-parse --git-path rebase-apply)" ]; then \
		echo "Error: a rebase is already in progress."; \
		echo "Resolve the conflicts, then run 'make continue'."; \
		exit 1; \
	fi
	@if ! git diff --quiet || ! git diff --cached --quiet; then \
		echo "==> Saving changes..."; \
		git add .; \
		git diff --cached --quiet || git commit -m "update blog"; \
	fi
	@echo "==> Updating main..."
	git switch main
	git pull --ff-only
	git switch dev
	@echo "==> Rebasing dev onto main..."
	git rebase main
	@echo "==> Publishing..."
	git switch main
	git merge --ff-only dev
	git push
	git switch dev


# 继续一次因冲突而中断的 sync
continue:
	@if [ "$$(git branch --show-current)" != "dev" ]; then \
		echo "Error: continue must be run on dev branch."; \
		exit 1; \
	fi
	@if [ ! -d "$$(git rev-parse --git-path rebase-merge)" ] && \
	   [ ! -d "$$(git rev-parse --git-path rebase-apply)" ]; then \
		echo "Error: no rebase is currently in progress."; \
		exit 1; \
	fi
	@echo "==> Continuing rebase..."
	git rebase --continue
	@echo "==> Publishing..."
	git switch main
	git merge --ff-only dev
	git push
	git switch dev
