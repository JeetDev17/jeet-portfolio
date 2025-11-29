#!/bin/bash
# Script to remove Git LFS tracking and re-add videos as regular files
# This fixes the 404 error on GitHub Pages

echo "🔧 Fixing Git LFS issue for GitHub Pages..."

# Step 1: Remove videos from Git cache (but keep local files)
echo "Step 1: Removing videos from Git cache..."
git rm --cached videos/*.mp4 2>/dev/null || true

# Step 2: Add .gitattributes (already updated)
echo "Step 2: Updating .gitattributes..."
git add .gitattributes

# Step 3: Re-add videos as regular files
echo "Step 3: Re-adding videos as regular files..."
git add videos/*.mp4

# Step 4: Commit the changes
echo "Step 4: Committing changes..."
git commit -m "Fix: Remove Git LFS tracking for GitHub Pages compatibility"

echo ""
echo "✅ Done! Now push to GitHub:"
echo "   git push origin main"
echo ""
echo "⚠️  Note: If you get errors about LFS, you may need to:"
echo "   1. Install git-lfs: brew install git-lfs"
echo "   2. Migrate files: git lfs migrate export --include='videos/*.mp4' --everything"
echo "   3. Then run this script again"

