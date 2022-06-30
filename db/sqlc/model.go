package db

import (
	"time"
)

type Account struct {
	ID       int64     `json:"id"`
	Owner    string    `json:"owner"`
	Balance  int64     `json:"balance"`
	Currency string    `json:"currency"`
	CreateAt time.Time `json:"create_at"`
}

type Entry struct {
	ID        int64 `json:"id"`
	AccountID int64 `json:"account_id"`
	// can be negative or positive
	Amount   int64     `json:"amount"`
	CreateAt time.Time `json:"create_at"`
}

type Transfer struct {
	ID            int64 `json:"id"`
	FromAccountID int64 `json:"from_account_id"`
	ToAccountID   int64 `json:"to_account_id"`
	// must be positive
	Amount   int64     `json:"amount"`
	CreateAt time.Time `json:"create_at"`
}
