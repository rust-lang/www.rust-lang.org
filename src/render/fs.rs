use anyhow::Context;
use std::path::Path;

pub fn ensure_directory(path: &Path) -> anyhow::Result<()> {
    if let Some(parent) = path.parent() {
        std::fs::create_dir_all(parent).with_context(|| {
            anyhow::anyhow!("Could not create parent directory for {}", path.display())
        })?;
    }
    Ok(())
}
