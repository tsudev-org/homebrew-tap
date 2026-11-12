# Homebrew tap chính thức của tsudev

Cài các app [tsudev](https://tsudev.com) trên macOS bằng [Homebrew](https://brew.sh).

```bash
brew install --cask tsudev-org/tap/tsudev-files
brew install --cask tsudev-org/tap/lotus-share
```

| Cask | Sản phẩm | Ghi chú |
| --- | --- | --- |
| `tsudev-files` | [tsudev Files](https://files.tsudev.com) - chuyển đổi tệp ngoại tuyến 260+ định dạng | Apple Silicon và Intel; kèm lệnh `tsudev-files` |
| `lotus-share` | [Lotus Share](https://lotus.tsudev.com) - gửi tệp trong mạng nội bộ, tương thích LocalSend | macOS 12 trở lên. Tên cũ `tsudev-lotus` (đã deprecate) vẫn nhận bản mới khi `brew upgrade`, nên chuyển: `brew uninstall --cask tsudev-lotus && brew install --cask tsudev-org/tap/lotus-share` |

Cập nhật: `brew upgrade --cask`. Gỡ: `brew uninstall --cask <tên>`.

## Bảo mật

- Mỗi cask ghim **SHA-256** lấy từ `SHA256SUMS` của chính Release trên `tsudev-org` và được đối chiếu với tệp tải
  về trước khi cập nhật; Homebrew từ chối cài nếu không khớp.
- Workflow `cap-nhat` kiểm Release mới mỗi 6 giờ và **cài thử thật** trên macOS trước khi đẩy lên.
- App chưa được Apple công chứng (notarize): lần mở đầu macOS có thể cảnh báo. Kiểm nguồn gốc bằng
  `gh attestation verify` hoặc mã băm trong Release.
- Quy ước đóng gói: [`tsudev-standards/docs/PACKAGING.md`](https://github.com/tsudev-org/tsudev-standards/blob/main/docs/PACKAGING.md).
