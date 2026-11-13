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

## Danh mục máy đọc

[`catalog.json`](catalog.json) (schema 1, cùng dạng `https://pkg.tsudev.com/catalog.json`) liệt kê mọi cask trong
tap: phiên bản, kiến trúc, macOS tối thiểu, lệnh đi kèm, cask thay thế khi đổi tên (`replacedBy`), lệnh cài.
Website `*.tsudev.com` và `install.sh` của tsudev.com đọc tệp này lúc build qua
`https://raw.githubusercontent.com/tsudev-org/homebrew-tap/main/catalog.json`. Sinh bằng `python3 tools/catalog.py`;
CI từ chối nếu tệp cũ, `cap-nhat` sinh lại cùng commit cập nhật cask.

## Bảo mật

- Mỗi cask ghim **SHA-256** lấy từ `SHA256SUMS` của chính Release trên `tsudev-org` và được đối chiếu với tệp tải
  về trước khi cập nhật; Homebrew từ chối cài nếu không khớp.
- Workflow `cap-nhat` kiểm Release mới mỗi 6 giờ và **cài thử thật** trên macOS trước khi đẩy lên.
- App chưa được Apple công chứng (notarize): lần mở đầu macOS có thể cảnh báo. Kiểm nguồn gốc bằng
  `gh attestation verify` hoặc mã băm trong Release.
- Quy ước đóng gói: [`tsudev-standards/docs/PACKAGING.md`](https://github.com/tsudev-org/tsudev-standards/blob/main/docs/PACKAGING.md).

## Giấy phép

Repo này (cask, `catalog.json`, công cụ): [Apache-2.0](LICENSE). Bản phân phối lại phải giữ `NOTICE` (điều 4(d)).
Mỗi ứng dụng giữ giấy phép của sản phẩm gốc. Tên và logo tsudev là nhãn hiệu, không nằm trong giấy phép: xem
[TRADEMARKS.md](https://github.com/tsudev-org/tsudev/blob/main/TRADEMARKS.md). PR chạm `LICENSE`, `NOTICE` hoặc xoá dòng
bản quyền cần chủ sở hữu phê duyệt (check `Bảo vệ bản quyền`, xem `AGENTS.md`).
